package com.example.quizeonline5.dto;

import lombok.Data;

@Data
public class CommonResponse<T> {
    private int code;       // Mã phản hồi (0 = Thành công, !=0 = Lỗi)
    private String message; // Thông báo (Success/Error Message)
    private T data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public CommonResponse(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public CommonResponse(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public CommonResponse() {
    }

    public static <T> CommonResponse<T> success(T data) {
        return new CommonResponse<>(0, "Success", data);
    }

    public static <T> CommonResponse<T> error(String message) {
        return new CommonResponse<>(1, message);
    }

    public static <T> CommonResponse<T> error(int code, String message) {
        return new CommonResponse<>(code, message);
    }

    public static <T> CommonResponse<T> error(int code, String message, T data) {
        return new CommonResponse<>(code, message, data);
    }

    // to string
    @Override
    public String toString() {
        return "CommonResponse{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
