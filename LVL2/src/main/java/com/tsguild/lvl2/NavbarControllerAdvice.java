package com.tsguild.lvl2;

import com.tsguild.lvl2.dao.StaticPageDao;
import com.tsguild.lvl2.dto.StaticPage;
import java.util.List;
import javax.inject.Inject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 *
 * @author Morgan Smith
 */
@ControllerAdvice
public class NavbarControllerAdvice {
    
    StaticPageDao staticDao;

    @Inject
    public NavbarControllerAdvice(StaticPageDao staticDao) {
        this.staticDao = staticDao;
    }

    @ModelAttribute
    public void addStaticPagesToModel(Model model) {
        List<StaticPage> staticPages = staticDao.getAllStaticPages();
        model.addAttribute("staticPages", staticPages);
    }

}
