/*
 * Author: jianqing
 * Date: Nov 4, 2020
 * Description: This document is created for
 */
package com.jianqinggao.surprisebday;

/**
 *
 * @author jianqing
 */
public class Music
{
    private int id;
    private String name, artist, url, cover, lrc, theme;

    public Music()
    {
    }

    
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getArtist()
    {
        return artist;
    }

    public void setArtist(String artist)
    {
        this.artist = artist;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getCover()
    {
        return cover;
    }

    public void setCover(String cover)
    {
        this.cover = cover;
    }

    public String getLrc()
    {
        return lrc;
    }

    public void setLrc(String lrc)
    {
        this.lrc = lrc;
    }

    public String getTheme()
    {
        return theme;
    }

    public void setTheme(String theme)
    {
        this.theme = theme;
    }

    @Override
    public String toString()
    {
        return "Music{" + "id=" + id + ", title=" + name + ", artist=" + artist + ", url=" + url + ", cover=" + cover + ", lrc=" + lrc + ", theme=" + theme + '}';
    }
    
    
}
