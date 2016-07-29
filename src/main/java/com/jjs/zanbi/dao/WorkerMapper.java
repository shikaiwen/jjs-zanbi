package com.jjs.zanbi.dao;

import com.jjs.zanbi.model.Worker;
import com.jjs.zanbi.model.WorkerExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkerMapper {




    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int countByExample(WorkerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int deleteByExample(WorkerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int insert(Worker record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int insertSelective(Worker record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    List<Worker> selectByExample(WorkerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    Worker selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int updateByExampleSelective(@Param("record") Worker record, @Param("example") WorkerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int updateByExample(@Param("record") Worker record, @Param("example") WorkerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int updateByPrimaryKeySelective(Worker record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table worker
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    int updateByPrimaryKey(Worker record);
}