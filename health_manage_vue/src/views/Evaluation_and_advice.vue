<script>

import request from "@/utils/request";
import analysis from "@/views/Analysis_A.vue";
import {ElNotification} from "element-plus";

export default {
  name: "Evaluation_and_advice",
  computed: {
  },
  components: {
  },
  data() {
    return {
      input: '',
      search: '',
      currentPage: 1,
      pageSize: 10,
      total: 10,
      dialogFormVisible: false,
      formLabelWidth: '160px',
      form: {},
      tableData: [],
      user: {},
      dialogVisible: false,
      index: 0,
    }
  },
  created(){
    let userStr=sessionStorage.getItem("user")||"{}"
    this.user=JSON.parse(userStr)
    this.select()
    this.form.name = this.user.username
    console.log(this.user)
  },
  methods: {
    edit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(id) {
      console.log(id)
      request.delete("/api/body/" + id).then(res => {
        console.log(res)
        if(res.code == '200'){
          this.$message({
            type:"success",
            message:"删除成功"
          })}
        else{
          this.$message({
            type:"error",
            message: res.message
          })
        }
      })
      this.select() //刷新
      this.select() //刷新
    },
    add() {
      this.dialogFormVisible = true
      this.form = {}
    },
    save() {
       if(this.form.id)
      {
        request.put("/api/body", this.form).then(res => {
          console.log(res)
          if (res.code == '200') {
            this.$message({
              type: "success",
              message: "更新成功"
            })
          } else {
            this.$message({
              type: "error",
              message: res.message
            })
          }
        })
      }
      else
      {
        request.post("/api/body", this.form).then(res => {
          console.log(res)
          if (res.code == '200') {
            this.$message({
              type: "success",
              message: "新增成功"
            })
          } else {
            this.$message({
              type: "error",
              message: res.message
            })
          }
        })
      }
      this.select() //刷新
      this.select() //刷新
      this.dialogFormVisible = false //关闭弹窗
    },
    handleSizeChange(){
      this.select()
    },
    handleCurrentChange(){
      this.select()
    },
    select() {
      request.get("/api/body", {
        params: {
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          search: this.user.username
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.records
        this.total = res.data.total
        sessionStorage.setItem("total", JSON.stringify(res.data.total));
        sessionStorage.setItem("body", JSON.stringify(res.data.records));
      })
    },
    conditionAnalysis(){
      this.index = this.tableData.findIndex(item => item.id == this.input)
      if (this.index === -1){
        this.$message({
          type: "error",
          message: "序号无效"
        })
      }else {
        if (this.total === 0) {
          this.dialogVisible = true
        } else {
          if (this.total === 1) {
            this.$router.push('/aa')
          } else {
            sessionStorage.setItem("idIndex", this.input)
            this.$router.push('/aa')
          }
        }
      }
    },
    start(){
      if(this.total === 0) {
        this.dialogVisible = true
      }
      else {
        if(this.total === 1) {
          this.openWarning()
          this.$router.push('/aa')
        }
        else{
          this.$message({
            type: "error",
            message: "请先输入序号并使用按序号分析功能！"
          })
        }
      }
    },
    openWarning(){
      ElNotification.warning({
        title: '注意',
        message: '仅可查询到一条相关数据，正在为您进行单条数据分析，若要进行多条数据分析需上传更多信息哦~',
        showClose: false,
      })
    }
  }
}

</script>

<template>
  <div>
    <div style="margin: 10px 0; padding-left: 10px ">
    <el-button type="primary" @click="this.$router.push('/information_update')">新增</el-button>
      <el-button plain @click="start">开始分析</el-button>
      <div>
        <el-input v-model="input" style="width: 300px; padding-top: 15px" placeholder="请输入想要进行单次分析的总库序号" clearable/>
        <el-button style="margin-left: 10px; margin-top: 15px" @click="conditionAnalysis">按序号分析</el-button>
      </div>
      <el-dialog v-model="dialogVisible" title="分析失败" width="500" :before-close="handleClose">
        <span>还没上传身体信息呢！</span>
        <template #footer>
          <div class="dialog-footer">
            <el-button @click="dialogVisible = false">确认</el-button>
            <el-button type="primary" @click="this.$router.push('/information_update')">去上传</el-button>
          </div>
        </template>
      </el-dialog>
  </div>
      <el-table :data="tableData" border style="width: 2450px; padding: 10px" >
        <el-table-column prop="id" label="总库序号" width="90" />
        <el-table-column prop="name" label="用户名" width="80"/>
        <el-table-column prop="age" label="年龄" width="60"/>
        <el-table-column prop="gender" label="性别" width="60"/>
        <el-table-column prop="height" label="身高（米）" width="100"/>
        <el-table-column prop="weight" label="体重（千克）" width="110" />
        <el-table-column prop="bloodSugar" label="空腹血糖（毫摩尔/升）" width="180" />
        <el-table-column prop="bloodPressureH" label="血压高压（毫米汞柱）" width="180"/>
        <el-table-column prop="bloodPressureL" label="血压低压（毫米汞柱）" width="180"/>
        <el-table-column prop="bloodLipid" label="血脂（毫摩尔/升）" width="160"/>
        <el-table-column prop="heartRate" label="心率（次/分钟）" width="130"/>
        <el-table-column prop="vision" label="视力" width="60"/>
        <el-table-column prop="sleepDuration" label="睡眠时间（小时）" width="140"/>
        <el-table-column prop="sleepQuality" label="睡眠质量" width="90" />
        <el-table-column prop="smoking" label="抽烟情况" width="90"/>
        <el-table-column prop="drinking" label="饮酒情况" width="90"/>
        <el-table-column prop="exercise" label="锻炼情况" width="90"/>
        <el-table-column prop="foodTypes" label="食物偏向" width="90"/>
        <el-table-column prop="waterConsumption" label="饮水量" width="80"/>
        <el-table-column prop="date" label="日期" width="250"/>
        <el-table-column label="Operations">
          <template #default="scope">
            <el-button size="small" @click="edit(scope.row)">编辑</el-button>
            <el-button size="small" type="danger" @click="del(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    <div style="margin: 10px 0; padding-left: 10px">
      <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[5, 10, 15, 20]"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange">
      </el-pagination>
    </div>
    <el-dialog v-model="dialogFormVisible" title="身体信息上传" width="500">
      <el-form :model="form">
        <el-form-item label="用户名" :label-width="formLabelWidth">
          <el-input v-model="form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item label="年龄" :label-width="formLabelWidth">
          <el-input v-model="form.age" autocomplete="off" />
        </el-form-item>
        <el-form-item label="性别" :label-width="formLabelWidth">
          <div class="mb-2 flex items-center text-sm">
            <el-radio-group v-model="form.gender" class="ml-4">
              <el-radio value="男" size="large">男</el-radio>
              <el-radio value="女" size="large">女</el-radio>
            </el-radio-group>
          </div>
        </el-form-item>
        <el-form-item label="身高（米）" :label-width="formLabelWidth">
          <el-input v-model="form.height" autocomplete="off" />
        </el-form-item>
        <el-form-item label="体重（千克）" :label-width="formLabelWidth">
          <el-input v-model="form.weight" autocomplete="off" />
        </el-form-item>
        <el-form-item label="空腹血糖（毫摩尔/升）" :label-width="formLabelWidth">
          <el-input v-model="form.bloodSugar" autocomplete="off" />
        </el-form-item>
        <el-form-item label="血压高压（毫米汞柱）" :label-width="formLabelWidth">
          <el-input v-model="form.bloodPressureH" autocomplete="off" />
        </el-form-item>
        <el-form-item label="血压低压（毫米汞柱）" :label-width="formLabelWidth">
          <el-input v-model="form.bloodPressureL" autocomplete="off" />
        </el-form-item>
        <el-form-item label="血脂（毫摩尔/升）" :label-width="formLabelWidth">
          <el-input v-model="form.bloodLipid" autocomplete="off" />
        </el-form-item>
        <el-form-item label="心率（次/分钟）" :label-width="formLabelWidth">
          <el-input v-model="form.heartRate" autocomplete="off" />
        </el-form-item>
        <el-form-item label="视力" :label-width="formLabelWidth">
          <el-input v-model="form.vision" autocomplete="off" />
        </el-form-item>
        <el-form-item label="睡眠时间（小时）" :label-width="formLabelWidth">
          <el-select v-model="form.sleepDuration" >
            <el-option label="4" value="4" />
            <el-option label="5" value="5" />
            <el-option label="6" value="5" />
            <el-option label="7" value="7" />
            <el-option label="8" value="8" />
            <el-option label="9" value="9" />
            <el-option label="10" value="10" />
            <el-option label="11" value="11" />
            <el-option label="12" value="12" />
          </el-select >
        </el-form-item>
        <el-form-item label="睡眠质量" :label-width="formLabelWidth">
          <el-select v-model="form.sleepQuality" >
            <el-option label="好" value="好" />
            <el-option label="一般" value="一般" />
            <el-option label="差" value="差" />
          </el-select>
        </el-form-item>
        <el-form-item label="抽烟情况" :label-width="formLabelWidth">
          <el-select v-model="form.smoking" >
            <el-option label="抽烟" value="1" />
            <el-option label="不抽烟" value="0" />
          </el-select >
        </el-form-item>
        <el-form-item label="饮酒情况" :label-width="formLabelWidth">
          <el-select v-model="form.drinking" >
            <el-option label="饮酒" value="1" />
            <el-option label="不饮酒" value="0" />
          </el-select >
        </el-form-item>
        <el-form-item label="锻炼情况" :label-width="formLabelWidth">
          <el-select v-model="form.exercise" >
            <el-option label="锻炼" value="1" />
            <el-option label="不锻炼" value="0" />
          </el-select >
        </el-form-item>
        <el-form-item label="食物偏好" :label-width="formLabelWidth">
          <el-select v-model="form.foodTypes" >
            <el-option label="豆类" value="豆类" />
            <el-option label="鱼类" value="鱼类" />
            <el-option label="水果" value="水果" />
            <el-option label="蔬菜" value="蔬菜" />
            <el-option label="谷类" value="谷类" />
            <el-option label="肉类" value="肉类" />
          </el-select >
        </el-form-item>
        <el-form-item label="饮水量（毫升）" :label-width="formLabelWidth">
          <el-select v-model="form.waterConsumption" >
            <el-option label="1000" value="1000" />
            <el-option label="1500" value="1500" />
            <el-option label="2000" value="2000" />
            <el-option label="2500" value="2500" />
            <el-option label="3000" value="3000" />
            <el-option label="3500" value="3500" />
          </el-select >
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="save">确定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>

</style>