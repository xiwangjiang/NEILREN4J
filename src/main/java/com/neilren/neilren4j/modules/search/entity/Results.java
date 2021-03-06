package com.neilren.neilren4j.modules.search.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by neil on 07/07/2017.
 */
public class Results implements Serializable {
    private String searchtime;
    private int total;
    private int num;
    private int viewtotal;
    private List<ResultsItems> items;

    public String getSearchtime() {
        return searchtime;
    }

    public void setSearchtime(String searchtime) {
        this.searchtime = searchtime;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getViewtotal() {
        return viewtotal;
    }

    public void setViewtotal(int viewtotal) {
        this.viewtotal = viewtotal;
    }

    public List<ResultsItems> getItems() {
        return items;
    }

    public void setItems(List<ResultsItems> items) {
        this.items = items;
    }
}
