package pl.KamilGolda.Workshop.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/login").permitAll()
                .antMatchers("/*").authenticated()
                .antMatchers("/order/*").hasAnyRole("USER","SU","ADMIN")
                .antMatchers("/service/*").hasAnyRole("USER","SU","ADMIN")
                .antMatchers("/parts/*").hasAnyRole("USER","SU","ADMIN")
                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/parts/add").hasAnyRole("ADMIN", "SU")
                .and().formLogin()
                .defaultSuccessUrl("/",true);

    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }
}

