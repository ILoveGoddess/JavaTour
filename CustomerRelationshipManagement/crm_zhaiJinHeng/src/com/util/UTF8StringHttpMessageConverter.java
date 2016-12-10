package com.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.util.FileCopyUtils;

/**
 * 解决springmvc 的@ResponseBody乱码问题
 */
public class UTF8StringHttpMessageConverter extends AbstractHttpMessageConverter<String> {

	public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");
	private final List<Charset> availableCharsets;
	private boolean writeAcceptCharset = true;

	public UTF8StringHttpMessageConverter() {
		super(new MediaType[] {
				new MediaType("text", "plain",
						UTF8StringHttpMessageConverter.DEFAULT_CHARSET),
				MediaType.ALL });
		this.availableCharsets = new ArrayList<Charset>(Charset.availableCharsets().values());
	}

	public void setWriteAcceptCharset(boolean writeAcceptCharset) {
		this.writeAcceptCharset = writeAcceptCharset;
	}

	public boolean supports(Class<?> clazz) {
		return String.class.equals(clazz);
	}

	@SuppressWarnings("unchecked")
	protected String readInternal(Class clazz, HttpInputMessage inputMessage) throws IOException {
		Charset charset = getContentTypeCharset(inputMessage.getHeaders().getContentType());
		return FileCopyUtils.copyToString(new InputStreamReader(inputMessage.getBody(), charset));
	}

	protected Long getContentLength(String s, MediaType contentType) {
		Charset charset = getContentTypeCharset(contentType);
		try {
			return Long.valueOf(s.getBytes(charset.name()).length);
		} catch (UnsupportedEncodingException ex) {

			throw new InternalError(ex.getMessage());
		}
	}

	protected void writeInternal(String s, HttpOutputMessage outputMessage) throws IOException {
		if (this.writeAcceptCharset) {
			outputMessage.getHeaders().setAcceptCharset(getAcceptedCharsets());
		}
		Charset charset = getContentTypeCharset(outputMessage.getHeaders().getContentType());
		FileCopyUtils.copy(s, new OutputStreamWriter( outputMessage.getBody(), charset));
	}
	protected List<Charset> getAcceptedCharsets() {
		return this.availableCharsets;
	}
	private Charset getContentTypeCharset(MediaType contentType) {
		if ((contentType != null) && (contentType.getCharSet() != null)) {
			return contentType.getCharSet();
		}
		return DEFAULT_CHARSET;
	}
}
