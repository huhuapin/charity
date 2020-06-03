package com.charity.util;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Objects;

/**
 * 例1：String str = JacksonUtil.toJson(userList);
 * 例2：User u = JacksonUtil.jsonToBean(str, User.class);
 * 例3：List<User> userList = JacksonUtil.jsonTo(str, new TypeReference<List<User>>(){});
 * 例4：Map<String, User> map = JacksonUtil.jsonTo(str, new TypeReference<Map<String, User>(){});
 */
public class JacksonUtil {
    private static ObjectMapper mapper = new ObjectMapper();

    static {
        mapper.enable(SerializationFeature.INDENT_OUTPUT); //化化输出
        mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS); //序列化空的POPJ
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); //不将date转化成timestamp
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES); //忽略未知属性
        mapper.disable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT); //不将空转化为null
        mapper.disable(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES); //允许没有引号的字段名（非标准）
        mapper.enable(SerializationFeature.WRITE_ENUMS_USING_TO_STRING);
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
    }

    public JacksonUtil() {
    }

    public static ObjectMapper getNewMapper() {
        return new ObjectMapper();
    }

    public static ObjectMapper getNewDefaultMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS); //序列化空的POPJ
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); //不将date转化成timestamp
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES); //忽略未知属性
        mapper.disable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT); //不将空转化为null
        mapper.disable(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES); //允许没有引号的字段名（非标准）
        mapper.enable(SerializationFeature.WRITE_ENUMS_USING_TO_STRING);
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        return mapper;
    }

    public static <T> String toJson(T t) {
        return toJson(t, null);
    }

    public static <T> T jsonTo(String json, TypeReference<T> typeReference) {
        return jsonTo(json, typeReference, null);
    }

    public static <T> T jsonToBean(String json, Class<T> clazz) {
        return jsonToBean(json, clazz, null);
    }

    public static <T> T fileToBean(File file, Class<T> clazz) {
        return fileToBean(file, clazz, null);
    }

    public static <T> String toJson(T t, ObjectMapper objectMapper) {
        if (Objects.isNull(t))
            return null;
        try {
            return objectMapper == null ? mapper.writeValueAsString(t) : objectMapper.writeValueAsString(t);
        } catch (JsonProcessingException e) {
            return null;
        }
    }

    public static <T> T jsonToBean(String json, Class<T> clazz, ObjectMapper objectMapper) {
        if (StringUtils.isBlank(json))
            return null;
        try {
            return objectMapper == null ? mapper.readValue(json, clazz) : objectMapper.readValue(json, clazz);
        } catch (IOException e) {
            return null;
        }
    }

    public static <T> T fileToBean(File file, Class<T> clazz, ObjectMapper objectMapper) {
        if (!file.exists())
            return null;
        try {
            return objectMapper == null ? mapper.readValue(file, clazz) : objectMapper.readValue(file, clazz);
        } catch (IOException e) {
            return null;
        }
    }

    public static <T> T jsonTo(String json, TypeReference<T> typeReference, ObjectMapper objectMapper) {
        if (StringUtils.isBlank(json))
            return null;
        try {
            return (T) (objectMapper == null ? mapper.readValue(json, typeReference) : objectMapper.readValue(json, typeReference));
        } catch (Exception e) {
            return null;
        }
    }

    public static <T> T jsonTo(String json, Class<T> clazz, ObjectMapper objectMapper) {
        if (StringUtils.isBlank(json))
            return null;
        try {
            return mapper.readValue(json, new TypeReference<T>(){});
        } catch (Exception e) {
            return null;
        }
    }
}