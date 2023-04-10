package com.stackroute.keepnotes.dao;

import java.util.List;

import com.stackroute.keepnotes.model.News;

public interface NewsDAO {
	
	
	public boolean addNews(News news);

	public boolean deleteNews(int newsId);

	public List<News> getAllNews();

	public News getNewsById(int newsId);

	public boolean updateNews(News news);


}
