package vn.iotstar.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.api.dto.AuthRequest;
import vn.iotstar.api.entity.User;
import vn.iotstar.api.service.JwtService;
import vn.iotstar.api.service.UserInfoService;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserInfoService service;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private AuthenticationManager authenticationManager;

    // 1. Đăng ký tài khoản
    @PostMapping("/register")
    public String addNewUser(@RequestBody User userInfo) {
        return service.addUser(userInfo);
    }

    // 2. Đăng nhập & Lấy Token
    @PostMapping("/login")
    public String authenticateAndGetToken(@RequestBody AuthRequest authRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword())
        );
        if (authentication.isAuthenticated()) {
            return jwtService.generateToken(authRequest.getUsername());
        } else {
            throw new UsernameNotFoundException("Yêu cầu đăng nhập không hợp lệ!");
        }
    }
}