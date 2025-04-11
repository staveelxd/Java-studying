package com.example.demo.services;

import com.example.demo.models.Image;
import com.example.demo.models.Product;
import com.example.demo.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final ProductRepository productRepository;

    private final List<Product> products = new ArrayList<>();

    public List<Product> getProducts(String name) {
        List<Product> products = productRepository.findAll();
        if (name != null) {
            return productRepository.findByName(name);
        }
        return productRepository.findAll();
    }

    public void addProduct(Product product, MultipartFile file) throws IOException {
        Image image;
        if(file != null) {
            image = toImageEntity(file);
            image.setPreview(true);
            product.addImage(image);
        }
        log.info("Adding product. Name: {}, Price: {}", product.getName(), product.getPrice());
        Product productFromDB = productRepository.save(product);
        productFromDB.setPreviewImageId(productFromDB.getImages().getFirst().getId());
        productRepository.save(product);
        products.add(product);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setSize(file.getSize());
        image.setType(file.getContentType());
        image.setUrl(file.getOriginalFilename());
        image.setBytes(file.getBytes());
        return image;
    }

    public void removeProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
