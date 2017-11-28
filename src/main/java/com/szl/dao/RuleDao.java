package com.szl.dao;

import com.szl.domain.Rule;

import java.util.List;

/**
 * Created by zsc on 2017/11/16.
 */
public interface RuleDao {

    public void insertRule(Rule Rule);

    public void insertAllRule(List<Rule> RuleList);

    public Rule selectRuleById(int RuleId);

    public Rule selectRuleByName(String name);

    public List<Rule> selectAllRules();

    public void updateRule(Rule Rule);

    public void deleteRule(int Id);


}
