package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.SidoGugunDongDto;
import com.ssafy.happyhouse.model.service.HouseService;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;

@Controller
@RequestMapping("/house")
public class HouseController {

	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/sido", method = RequestMethod.GET)
	@ResponseBody
	public List<SidoGugunDongDto> getSido() throws Exception {
		System.out.println(houseService.getSido());
		return houseService.getSido();
	}
	
}
