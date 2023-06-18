package com.demo.service;

import com.demo.entity.Event;
import com.demo.repository.EventRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class EventServiceImpl implements EventService{

    private  final EventRepository eventRepository;
    @Override
    public Event add(Event event, MultipartFile multipartFile, HttpServletRequest request) {


        String path = request.getSession().getServletContext().getRealPath("/");
        String filePath = path + "event-images";
        String fileName = multipartFile.getOriginalFilename();
        if (fileName != null && !fileName.equals("")) {
            try {
                byte barr[] = multipartFile.getBytes();

                BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));
                bout.write(barr);
                bout.flush();
                bout.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (event.getId() == null) {
            event.setCreateAt(new Date());
            event.setModifiedAt(new Date());
            event.setStatus(true);
            event.setEventImage(fileName);
            return eventRepository.save(event);
        } else {
            Event event1 = eventRepository.findById(event.getId()).get();
            event.setCreateAt(event1.getCreateAt());
            event.setModifiedAt(new Date());
            event.setStatus(event1.getStatus());
            if (fileName != null && !fileName.equals("")) {
                event.setEventImage(fileName);
            } else {
                event.setEventImage(event1.getEventImage());
            }
            return this.eventRepository.save(event);
        }
    }


    @Override
    public List<Event> getAll() {
        return eventRepository.findAllByStatusTrue();
    }

    @Override
    public void delete(int id) {
        Event deleteId = eventRepository.findById(id).orElse(new Event());
        deleteId.setStatus(false);
        this.eventRepository.save(deleteId);

    }

    @Override
    public Event findById(Integer id) throws Exception {
        return eventRepository.findById(id).orElse(new Event());
    }
}
