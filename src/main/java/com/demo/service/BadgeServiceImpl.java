package com.demo.service;

import com.demo.entity.Badge;
import com.demo.entity.BadgeCriteria;
import com.demo.repository.BadgeCriteriaRepository;
import com.demo.repository.BadgeReository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class BadgeServiceImpl implements BadgeService {

    private final BadgeReository badgeReository;

    private final BadgeCriteriaRepository badgeCriteriaRepository;

    @Override
    public List<Badge> getAll() {
        return this.badgeReository.findAllByStatusTrue();
    }

    @Override
    public void addBadge(Badge badge, MultipartFile multipartFile, HttpServletRequest request, String[] criteria) {

        try {
            String path = request.getSession().getServletContext().getRealPath("/");
            String filePath = path + "badge-images";
            String fileName = multipartFile.getOriginalFilename();
            if (badge.getId() == null) {
                badge.setCreateAt(new Date());
                badge.setModifiedAt(new Date());
                badge.setStatus(true);
                badge.setBadgeImage(fileName);

                Badge saveBadge = this.badgeReository.save(badge);
                if (criteria != null) {
                    for (String criterion : criteria) {
                        BadgeCriteria badgeCriteria = new BadgeCriteria();
                        badgeCriteria.setBadge(saveBadge);
                        badgeCriteria.setCriteria(criterion);
                        badgeCriteria.setCreateAt(new Date());
                        badgeCriteria.setModifiedAt(new Date());
                        badgeCriteria.setStatus(true);
                        badgeCriteriaRepository.save(badgeCriteria);
                    }
                }

            } else {

                Badge badge1 = badgeReository.findById(badge.getId()).get();
                badge.setCreateAt(badge1.getCreateAt());
                badge.setModifiedAt(new Date());
                badge.setStatus(badge1.getStatus());
                if (fileName != null && !fileName.equals("")) {
                    badge.setBadgeImage(fileName);
                } else {
                    badge.setBadgeImage(badge1.getBadgeImage());
                }

                Badge saveBadge1 = this.badgeReository.save(badge);
                if (criteria != null) {
                    for (String criterion : criteria) {
                        BadgeCriteria badgeCriteria = new BadgeCriteria();
                        badgeCriteria.setBadge(saveBadge1);
                        badgeCriteria.setCriteria(criterion);
                        badgeCriteria.setCreateAt(new Date());
                        badgeCriteria.setModifiedAt(new Date());
                        badgeCriteria.setStatus(true);
                        badgeCriteriaRepository.save(badgeCriteria);
                    }
                }

            }
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

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    @Override
    public void deleteBadge(Integer id) {

        Badge badge = this.searchById(id);
        badge.setModifiedAt(new Date());
        badge.setCreateAt(new Date());
        badge.setStatus(false);
        this.badgeReository.save(badge);

        List<BadgeCriteria> badgeCriteria = this.badgeCriteriaRepository.findAllByBadgeId(badge.getId()).orElse(new ArrayList<>());
        badgeCriteria.stream().peek(r -> {
            r.setStatus(false);
            r.setModifiedAt(new Date());
        }).map(badgeCriteriaRepository::save).collect(Collectors.toList());
    }

    @Override
    public Badge findById(Integer id) {
        return this.searchById(id);
    }

    private Badge searchById(Integer id) {
        try {
            return badgeReository.findByIdAndStatusTrue(id).orElseThrow(() -> new Exception("not found"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
