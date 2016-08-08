package ru.mrchebik.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

/**
 * Created by mrchebik on 08.08.16.
 */
@Controller
@RequestMapping("/duplicate")
public class DuplicateController {

    @RequestMapping(method = GET)
    public String duplicate() {
        return "Duplicate";
    }

}
