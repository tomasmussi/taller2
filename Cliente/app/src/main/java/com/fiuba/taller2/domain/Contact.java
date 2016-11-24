package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;

/**
 * Created by luis on 20/11/16.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Contact implements Serializable{
           private String  distance;
           private String  fb_id;
           private String  is_contact;
           private String  name;
           private String  photo;
           private String  votes;

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public String getFb_id() {
        return fb_id;
    }

    public void setFb_id(String fb_id) {
        this.fb_id = fb_id;
    }

    public String getIs_contact() {
        return is_contact;
    }

    public void setIs_contact(String is_contact) {
        this.is_contact = is_contact;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getVotes() {
        return votes;
    }

    public void setVotes(String votes) {
        this.votes = votes;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "distance='" + distance + '\'' +
                ", fb_id='" + fb_id + '\'' +
                ", is_contact='" + is_contact + '\'' +
                ", name='" + name + '\'' +
                ", photo='" + photo + '\'' +
                ", votes='" + votes + '\'' +
                '}';
    }
}
