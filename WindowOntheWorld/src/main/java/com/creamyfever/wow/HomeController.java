package com.creamyfever.wow;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "home";
	}
	
	@RequestMapping(value = "/pythonTest", method = RequestMethod.GET)
	public String pythonTest() {
		String pythonExe = "C:/Users/Creamy/Anaconda3/python.exe";
		String pythonRes = "python/parser.py";

		String pythonPath = this.getClass().getClassLoader().getResource(pythonRes).getPath();
		String realPath = pythonPath.substring(1);	// 앞에 "/" 제거
		
		ProcessBuilder pb = new ProcessBuilder(Arrays.asList(pythonExe, realPath));
		try {
			Process p = pb.start();
			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));
			
            String line = "";
            System.out.println("Running Python starts: " + line);
            
            int exitCode = p.waitFor();
            System.out.println("Exit Code : "+ exitCode);
            line = bfr.readLine();
            System.out.println("First Line: " + line);
            while ((line = bfr.readLine()) != null){
                System.out.println("Python Output: " + line);
            }
            
            if(exitCode == 0) {
            	p.destroy();
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "home";
	}
}
