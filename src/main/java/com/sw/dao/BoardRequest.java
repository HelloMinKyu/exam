package com.sw.dao;

import lombok.Data;

@Data
public class BoardRequest {
    private String title;
    private String content;
    private String writer;

}
