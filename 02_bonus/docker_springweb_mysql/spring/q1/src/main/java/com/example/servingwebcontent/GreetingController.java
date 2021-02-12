package com.example.servingwebcontent;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class GreetingController {

    @Autowired
    DbHandler db;

    @GetMapping()
    public String start(Model model) {
        model.addAttribute("people", db.select());
        return "start";
    }

    @GetMapping("/new")
    public String newPerson() {
        return "new";
    }


    @PostMapping("/")
    public String create(@RequestParam("name") String name,
                         @RequestParam("surname") String surname,
                         @RequestParam("position") String position) {
        db.insert(name, surname, position);
        return "redirect:/";
    }

}
