package com.example.demo.services;

import com.example.demo.models.Image;
import com.example.demo.models.Product;
import com.example.demo.models.User;
import com.example.demo.repositories.ProductRepository;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;


    public List<Product> getProducts(String name) {
        if (name != null) {
            return productRepository.findByName(name);
        }
        return productRepository.findAll();
    }

    public void addProduct(Principal principal, Product product, MultipartFile file) throws IOException {
        product.setUser(getUserByPrincipal(principal));
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
    }

    public User getUserByPrincipal (Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
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

    public void removeProduct(User user, Long id) {
        Product product = productRepository.findById(id)
                .orElse(null);
        if (product != null) {
            if (product.getUser().getId().equals(user.getId())) {
                productRepository.delete(product);
                log.info("Product with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this product with id = {}", user.getEmail(), id);
            }
        } else {
            log.error("Product with id = {} is not found", id);
        }
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
