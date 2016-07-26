package com.jjs.zanbi.dao;

import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.model.SendRecordDetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SendRecordDetailMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int countByExample(SendRecordDetailExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int deleteByExample(SendRecordDetailExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int insert(SendRecordDetail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int insertSelective(SendRecordDetail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    List<SendRecordDetail> selectByExample(SendRecordDetailExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    SendRecordDetail selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int updateByExampleSelective(@Param("record") SendRecordDetail record, @Param("example") SendRecordDetailExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int updateByExample(@Param("record") SendRecordDetail record, @Param("example") SendRecordDetailExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int updateByPrimaryKeySelective(SendRecordDetail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table send_record_detail
     *
     * @mbggenerated Tue Jul 26 22:03:22 CST 2016
     */
    int updateByPrimaryKey(SendRecordDetail record);
}