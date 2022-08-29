package com.model2.mvc.web.product;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {

	// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['uploadTempDir']}")
	String uploadTempDir;

//	@RequestMapping("/addProduct.do")
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("ProdVO") Product product,
			@RequestParam("fileUploadName") List<MultipartFile> multipartFile) throws Exception {

		System.out.println("/product/addProduct : POST");

		List<String> file = new ArrayList<String>();

		for (int i = 0; i < multipartFile.size(); i++) {

			if (multipartFile.get(i) != null & multipartFile.get(i).getSize() > 0) {
				multipartFile.get(i).transferTo(new File(uploadTempDir, multipartFile.get(i).getOriginalFilename()));
				file.add(multipartFile.get(i).getOriginalFilename());
				product.setFileName(file);
			}
		}

		String manuDate = product.getManuDate().replace("-", "");
		product.setManuDate(manuDate);
		System.out.println(manuDate);
		
		System.out.println(file);
		System.out.println("fileName : " + product.getFileName());

		if (file.isEmpty()) {
			System.out.println("�̰��� If�� ��");
			product.setFileName(null);
			System.out.println(product.getFileName());
		}else {
			product.setFileName(file);
		}

		productService.addProduct(product);
		productService.addFile(product);

		return "forward:/product/readProductView.jsp";
	}

//	@RequestMapping("/getProduct.do")
	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam int prodNo, HttpServletRequest request, Model model) throws Exception {

		System.out.println("/product/getProduct : GET");
		Product prod = productService.getProduct(prodNo);
		List<String> file = productService.getFile(prod);

		model.addAttribute("prod", prod);
		model.addAttribute("list", file);

		String history = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = URLDecoder.decode("," + cookie.getValue());
				}
			}
		}

		Cookie cookie = new Cookie("history", URLEncoder.encode(prodNo + history));

		return "forward:/product/updateProductView.jsp";
	}

//	@RequestMapping("/updateProduct.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("update") Product prod,
			@RequestParam("fileUploadName") List<MultipartFile> multipartFile) throws Exception {

		System.out.println("/product/updateProduct : POST");
		System.out.println(multipartFile);
/*
		if (multipartFile.equals("")) {
			prod.setFileName(null);
		}
//*/
		List<String> file = new ArrayList<String>();

		for (int i = 0; i < multipartFile.size(); i++) {

			if (multipartFile.get(i) != null & multipartFile.get(i).getSize() > 0) {

				multipartFile.get(i).transferTo(new File(uploadTempDir, multipartFile.get(i).getOriginalFilename()));
				file.add(multipartFile.get(i).getOriginalFilename());
			}
		}
		
		System.out.println("file�� ���� �� : "+file);
		
		if (file.isEmpty()) {
			System.out.println("�̰��� If�� ��");
			prod.setFileName(null);
			System.out.println(prod.getFileName());
		}else {
			prod.setFileName(file);
		}
		
		System.out.println(prod.getFileName());
		productService.updateProduct(prod);
		productService.updateFile(prod);

		return "forward:/product/updateReadProduct.jsp";
	}

//	@RequestMapping("/updateProductView.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProductView(@RequestParam int prodNo, Model model) throws Exception {

		System.out.println("/product/updateProduct : GET");
		Product prod = productService.getProduct(prodNo);
		model.addAttribute("UpdateProdVO", prod);

		return "forward:/product/updateProduct.jsp";
	}

//	@RequestMapping("/listProduct.do")
	@RequestMapping(value = "listProduct")
	public String listProduct(@ModelAttribute("Search") Search search, Model model, @RequestParam("menu") String menu)
			throws Exception {

		System.out.println("/product/listProduct : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("menu", menu);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/product/productList.jsp";
	}
}
