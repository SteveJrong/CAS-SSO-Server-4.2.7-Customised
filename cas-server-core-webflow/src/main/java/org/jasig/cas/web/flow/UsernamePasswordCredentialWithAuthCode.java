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
package org.jasig.cas.web.flow;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.jasig.cas.authentication.UsernamePasswordCredential;

/**
 * 
 * @author Steve Jrong
 * create date: 2018/1/25 5:49:04 PM
 */
public class UsernamePasswordCredentialWithAuthCode extends UsernamePasswordCredential {

	private static final long serialVersionUID = 1L;

	@NotNull
	@Size(min = 1, message = "required.authcode")
	private String authcode;

	public final String getAuthcode() {
		return authcode;
	}

	public final void setAuthcode(String authcode) {
		this.authcode = authcode;
	}

	public UsernamePasswordCredentialWithAuthCode() {
		super();
	}

	public UsernamePasswordCredentialWithAuthCode(String userName, String password) {
		super(userName, password);
	}

	@Override
	public boolean equals(final Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}

		final UsernamePasswordCredentialWithAuthCode that = (UsernamePasswordCredentialWithAuthCode) o;

		if (getPassword() != null ? !getPassword().equals(that.getPassword()) : that.getPassword() != null) {
			return false;
		}

		if (getPassword() != null ? !getPassword().equals(that.getPassword()) : that.getPassword() != null) {
			return false;
		}
		if (authcode != null ? !authcode.equals(that.authcode) : that.authcode != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(getUsername()).append(getPassword()).append(authcode).toHashCode();
	}
}
