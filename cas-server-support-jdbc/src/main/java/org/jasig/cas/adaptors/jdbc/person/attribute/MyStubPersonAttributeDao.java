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
package org.jasig.cas.adaptors.jdbc.person.attribute;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import javax.validation.constraints.NotNull;

import org.jasig.services.persondir.IPersonAttributes;
import org.jasig.services.persondir.support.AttributeNamedPersonImpl;
import org.jasig.services.persondir.support.StubPersonAttributeDao;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * Customed class for get more infomations by login user.
 * 
 * @author Steve Jrong
 * create date: 2018/1/27 1:39:06 PM
 */
public class MyStubPersonAttributeDao extends StubPersonAttributeDao {

	private JdbcTemplate jdbcTemplate;

    private DataSource dataSource;

    /**
     * Method to set the datasource and generate a JdbcTemplate.
     *
     * @param dataSource the datasource to use.
     */
    public void setDataSource(@NotNull final DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.dataSource = dataSource;
    }

    /**
     * Method to return the jdbcTemplate.
     *
     * @return a fully created JdbcTemplate.
     */
    protected final JdbcTemplate getJdbcTemplate() {
        return this.jdbcTemplate;
    }

    protected final DataSource getDataSource() {
        return this.dataSource;
    }
	
    /**
     * Override the getPerson(String) method successed in getting more login user infos in StubPersonAttributeDao class.
     */
	@Override
	public IPersonAttributes getPerson(String uid) {
		Map<String, List<Object>> attributes = new HashMap<String, List<Object>>();

		Map<String, Object> queryMap = this.getJdbcTemplate().queryForMap("select * from db_user where user_name = '" + uid + "'");

		attributes.put("userCreateDate", Collections.singletonList((Object) queryMap.get("create_date")));
		attributes.put("userModifyDate", Collections.singletonList((Object) queryMap.get("modify_date")));
		attributes.put("userIdentity", Collections.singletonList((Object) queryMap.get("user_id")));
		attributes.put("userFullName", Collections.singletonList((Object) queryMap.get("user_name")));
		attributes.put("userPassword", Collections.singletonList((Object) queryMap.get("password")));
		attributes.put("userGender", Collections.singletonList((Object) queryMap.get("gender")));
		attributes.put("userAge", Collections.singletonList((Object) queryMap.get("age")));
		return new AttributeNamedPersonImpl(attributes);
	}
}
