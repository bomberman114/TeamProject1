package com.green.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.interceptor.AuthInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {


   @Autowired   
   private  AuthInterceptor  authInterceptor;
   
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      
      registry.addInterceptor( authInterceptor )
             .addPathPatterns( "/**" )
             .excludePathPatterns( 
            		 "/css/**", "/img/**", "/js/**", "/" 
            		 , "/Resume/SearchAddress/**", "/Common/**"
            		 , "/Users/CheckDuplication/**","/Company/CheckDuplication/**"
            		 , "/Common/**", "/Resume/**"
            		 );
      
      WebMvcConfigurer.super.addInterceptors(registry);


   }
   
}