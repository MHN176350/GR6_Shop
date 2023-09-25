/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Minh
 */
public class Blog {
   public int id;
   public String title;
   public String content;
   public int auth_id;
   public String cate;
   public String thumb;

    public Blog() {
    }

    public Blog(int id, String title, String content, int auth_id, String cate, String thumb) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.auth_id = auth_id;
        this.cate = cate;
        this.thumb = thumb;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAuth_id() {
        return auth_id;
    }

    public void setAuth_id(int auth_id) {
        this.auth_id = auth_id;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", title=" + title + ", content=" + content + ", auth_id=" + auth_id + ", cate=" + cate + ", thumb=" + thumb + '}';
    }
   
}
