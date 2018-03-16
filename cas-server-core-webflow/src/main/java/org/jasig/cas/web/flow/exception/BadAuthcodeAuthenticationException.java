/**
 * Copyright 2018 Steve Jrong - https://www.stevejrong.top

 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at

 *     http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.jasig.cas.web.flow.exception;

import org.jasig.cas.authentication.RootCasException;

/**
 * 错误验证码异常处理类
 * 
 * @author Steve Jrong
 * create date: 2018/1/25 6:00:30 PM
 */
public class BadAuthcodeAuthenticationException extends RootCasException {
	/** Serializable ID for unique id. */
	private static final long serialVersionUID = 5501212207531289993L;

	/** Code description. */
	public static final String CODE = "error.authentication.authcode.bad";

	/**
	 * Constructs a TicketCreationException with the default exception code.
	 */
	public BadAuthcodeAuthenticationException() {
		super(CODE);
	}

	/**
	 * Constructs a TicketCreationException with the default exception code and
	 * the original exception that was thrown.
	 * 
	 * @param throwable
	 *            the chained exception
	 */
	public BadAuthcodeAuthenticationException(final Throwable throwable) {
		super(CODE, throwable);
	}
}
