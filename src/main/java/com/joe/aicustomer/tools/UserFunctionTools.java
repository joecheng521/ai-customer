package com.joe.aicustomer.tools;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.joe.aicustomer.entity.User;
import com.joe.aicustomer.enums.Gender;
import com.joe.aicustomer.service.UserService;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

/**
 * @author JOE
 */
@Service
public class UserFunctionTools {
    private final UserService userService;

    public UserFunctionTools(UserService userService) {
        this.userService = userService;
    }

    @JsonInclude(JsonInclude.Include.NON_NULL)
    public record UserDetails(Integer id,
                              String cnName,
                              String enName,
                              Gender gender,
                              String phone,
                              String email,
                              String cityCn,
                              String cityEn,
                              LocalDate regDate,
                              Integer vipLevel) {

    }

    public record UserDetailsRequest(Integer id,
                                     String cnName,
                                     String enName,
                                     Gender gender,
                                     String phone,
                                     String email,
                                     String cityCn,
                                     String cityEn,
                                     LocalDate regDate,
                                     Integer vipLevel) {
    }


    @Tool(description = "查询单个用户详细信息")
    public UserDetails queryUserDetailsFunction(@ToolParam(description = "用户ID")
                                                Integer id) {
        try {
            User user = userService.getUserById(id);
            if (user == null) {
                return new UserDetails(id, null, null, null, null, null, null, null, null, null);
            }
            return toUserDetails(user);
        } catch (Exception e) {
            return new UserDetails(id, null, null, null, null, null, null, null, null, null);
        }
    }


    private UserDetails toUserDetails(User user) {
        return new UserDetails(user.getId(), user.getCnName(), user.getEnName(), user.getGender(), user.getPhone(), user.getEmail(), user.getCityCn(), user.getCityEn(), user.getRegDate(), user.getVipLevel());
    }


}
