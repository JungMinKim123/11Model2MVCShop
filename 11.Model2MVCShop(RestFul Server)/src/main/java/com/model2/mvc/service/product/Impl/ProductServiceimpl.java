package com.model2.mvc.service.product.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.file.FileDao;

@Service("productServiceImpl")
public class ProductServiceimpl implements ProductService{
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;

	@Autowired
	@Qualifier("fileDaoImpl")
	private FileDao fileDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public void setFileDao(FileDao fileDao) {
		this.fileDao = fileDao;
	}
	
	public ProductServiceimpl() {
		System.out.println(this.getClass());
	}
	
	public void addProduct(Product product) throws Exception{
		productDao.insertProduct(product);
	}
	
	public void addFile(Product product) throws Exception{
		
		fileDao.addFile(product);
	}
	
	public Product getProduct(int productNo) throws Exception{
		return productDao.findProduct(productNo);
	}

	public List<String> getProdName(String product) throws Exception{
		
		List<String> list = productDao.getProdName(product);
		
		return list;
	}

	public List<String> getFile(Product product) throws Exception{
		
		//List<String> fileList = fileDao.findFile(product);
		
		//return fileList;
		return fileDao.findFile(product);
	}
	
	public Map<String, Object> getProductList(Search search) throws Exception{
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	
	public void updateProduct(Product product) throws Exception{
		productDao.updateProduct(product);
	}

	public void updateFile(Product product) throws Exception {
		fileDao.updateFile(product);
		
	}
	
}
