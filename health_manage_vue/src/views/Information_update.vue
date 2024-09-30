<script>
import request from "@/utils/request";

export default {
  name: "Information_update",
  components: {

  },
  data(){
    return {
      input: '',
      dialogFormVisible: true,
      formLabelWidth: '160px',
      form: {},
    }
  },
  methods:{
    add() {
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
      this.$router.push('/e_and_a')
    },
    handleClose(){
      this.$router.push("/home")
    },
  }
}
</script>

<template>
  <div>
    <el-dialog v-model="dialogFormVisible" title="身体信息上传" width="500" @close="handleClose">
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
          <el-button @click="dialogFormVisible = false;this.$router.push('/home')">取消</el-button>
          <el-button type="primary" @click="save">确定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>

</style>