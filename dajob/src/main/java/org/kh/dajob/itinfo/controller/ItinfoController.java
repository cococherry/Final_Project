package org.kh.dajob.itinfo.controller;

import org.kh.dajob.itinfo.model.service.ItinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ItinfoController {
	@Autowired
	ItinfoService itinfoService;
}
