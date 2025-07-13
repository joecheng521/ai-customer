package com.joe.aicustomer.mapper;

import com.joe.aicustomer.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author JOE
 */
@Mapper
public interface UserMapper {
    @Insert("INSERT INTO users (cn_name, en_name, gender, phone, email, city_cn, city_en, reg_date, vip_level) " +
            "VALUES (#{cnName}, #{enName}, #{gender}, #{phone}, #{email}, #{cityCn}, #{cityEn}, #{regDate}, #{vipLevel})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(User user);

    @Update("UPDATE users SET cn_name=#{cnName}, en_name=#{enName}, gender=#{gender}, phone=#{phone}, email=#{email}, " +
            "city_cn=#{cityCn}, city_en=#{cityEn}, reg_date=#{regDate}, vip_level=#{vipLevel} WHERE id=#{id}")
    void update(User user);

    @Delete("DELETE FROM users WHERE id = #{id}")
    void delete(Integer id);

    @Select("SELECT * FROM users WHERE id = #{id}")
    User selectById(Integer id);

    @Select("SELECT * FROM users")
    List<User> selectAll();
}