package com.example.demo.controller;


import com.example.demo.models.Product;
import com.example.demo.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name = "name", required = false) String name, Principal principal, Model model) {
        model.addAttribute("products", productService.getProducts(name));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "products";
    }
    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file") MultipartFile file, Product product, Principal principal)
    throws IOException {
        productService.addProduct(principal, product, file);
        return "redirect:/";
    }
    @PostMapping("/product/remove/{id}")
    public String removeProduct(@PathVariable Long id) {
        productService.removeProduct(id);
        return "redirect:/";
    }
}
