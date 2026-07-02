<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="套餐名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入套餐名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="套餐编码" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入套餐编码"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="助记码" prop="helpCode">
        <el-input
          v-model="queryParams.helpCode"
          placeholder="请输入助记码"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['reservation:setmeal:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['reservation:setmeal:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['reservation:setmeal:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['reservation:setmeal:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="setmealList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="套餐ID" align="center" prop="id" />
      <el-table-column label="套餐名称" align="center" prop="name" />
      <el-table-column label="套餐编码" align="center" prop="code" />
      <el-table-column label="助记码" align="center" prop="helpCode" />
      <el-table-column label="适用性别" align="center" prop="sex">
        <template #default="scope">
          <dict-tag :options="sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="适用年龄" align="center" prop="age" />
      <el-table-column label="价格" align="center" prop="price" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="注意事项" align="center" prop="attention" />
      <el-table-column label="图片路径" align="center" prop="img" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.img" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['reservation:setmeal:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['reservation:setmeal:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="setmealRef" :model="form" :rules="rules" label-width="100px">
        <el-tabs v-model="activeTab" type="card">
          <el-tab-pane label="基本信息" name="first">
            <el-row>
              <el-col :span="12">
                <el-form-item label="套餐名称" prop="name">
                  <el-input v-model="form.name" placeholder="请输入套餐名称" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="套餐编码" prop="code">
                  <el-input v-model="form.code" placeholder="请输入套餐编码" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="助记码" prop="helpCode">
                  <el-input v-model="form.helpCode" placeholder="请输入助记码" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="适用性别" prop="sex">
                  <el-select v-model="form.sex" placeholder="请选择性别">
                    <el-option
                      v-for="dict in sys_user_sex"
                      :key="dict.value"
                      :label="dict.label"
                      :value="dict.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="适用年龄" prop="age">
                  <el-input v-model="form.age" placeholder="请输入适用年龄" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="价格" prop="price">
                  <el-input v-model="form.price" placeholder="请输入价格" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="备注" prop="remark">
                  <el-input v-model="form.remark" placeholder="请输入备注" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="注意事项" prop="attention">
                  <el-input v-model="form.attention" placeholder="请输入注意事项" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="图片路径" prop="img">
                  <image-upload v-model="form.img"/>
                </el-form-item>
              </el-col>
            </el-row>
          </el-tab-pane>
          <el-tab-pane label="检查组" name="second">
            <div class="check-scroll">
              <el-table
                ref="checkgroupTableRef"
                :data="checkgroupList"
                @selection-change="handleCheckgroupSelection"
                max-height="300"
              >
                <el-table-column type="selection" width="55" />
                <el-table-column label="检查组名称" prop="name" />
                <el-table-column label="检查组编码" prop="code" />
                <el-table-column label="助记码" prop="helpCode" />
              </el-table>
            </div>
          </el-tab-pane>
        </el-tabs>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Setmeal">
import { listSetmeal, getSetmeal, delSetmeal, addSetmeal, updateSetmeal } from "@/api/reservation/setmeal"
import { getAllCheckgroups } from "@/api/reservation/checkgroup"

const { proxy } = getCurrentInstance()

const setmealList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")
const activeTab = ref("first")
const checkgroupList = ref([])
const selectedCheckgroups = ref([])
const checkgroupTableRef = ref()
const queryRef = ref()
const setmealRef = ref()

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: undefined,
    code: undefined,
    helpCode: undefined,
  },
  rules: {
    name: [
      { required: true, message: "套餐名称不能为空", trigger: "blur" }
    ],
    code: [
      { required: true, message: "套餐编码不能为空", trigger: "blur" }
    ],
    helpCode: [
      { required: true, message: "助记码不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

function safeNumber(val) {
  if (val == null) return null
  const num = Number(val)
  return isNaN(num) ? val : num
}

function getAllCheckGroups() {
  return getAllCheckgroups({}).then(response => {
    checkgroupList.value = response.data.map(item => ({
      ...item,
      id: safeNumber(item.id)
    }))
  })
}

function getList() {
  loading.value = true
  listSetmeal(queryParams.value).then(response => {
    setmealList.value = response.rows.map(item => ({
      ...item,
      id: safeNumber(item.id)
    }))
    total.value = response.total
    loading.value = false
  })
}

function cancel() {
  open.value = false
  reset()
}

function reset() {
  form.value = {
    id: null,
    name: null,
    code: null,
    helpCode: null,
    sex: null,
    age: null,
    price: null,
    remark: null,
    attention: null,
    img: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  }
  proxy.resetForm("setmealRef")
  activeTab.value = "first"
  selectedCheckgroups.value = []
}

function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

function resetQuery() {
  proxy.resetForm("queryRef")
  handleQuery()
}

function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

function handleCheckgroupSelection(selection) {
  selectedCheckgroups.value = selection.map(item => safeNumber(item.id))
}

function handleAdd() {
  reset()
  open.value = true
  title.value = "添加套餐管理"
  getAllCheckGroups()
}

function handleUpdate(row) {
  reset()
  const _id = row.id || ids.value[0]
  getSetmeal(_id).then(response => {
    const data = response.data
    form.value = {
      ...data,
      id: safeNumber(data.id)
    }
    open.value = true
    title.value = "修改套餐管理"

    getAllCheckGroups().then(() => {
      let checkgroupIds = data.checkgroupIds || []
      if (!Array.isArray(checkgroupIds)) checkgroupIds = []
      const targetIds = checkgroupIds.map(id => safeNumber(id)).filter(id => id != null)
      selectedCheckgroups.value = [...targetIds]

      nextTick(() => {
        const table = checkgroupTableRef.value
        if (!table) return
        table.clearSelection()
        const idSet = new Set(targetIds)
        checkgroupList.value.forEach(item => {
          if (idSet.has(item.id)) {
            table.toggleRowSelection(item, true)
          }
        })
      })
    })
  })
}

function submitForm() {
  proxy.$refs["setmealRef"].validate(valid => {
    if (valid) {
      const formData = { ...form.value }
      formData.checkgroupIds = selectedCheckgroups.value
      const api = formData.id != null ? updateSetmeal : addSetmeal
      api(formData).then(() => {
        proxy.$modal.msgSuccess(formData.id ? "修改成功" : "新增成功")
        open.value = false
        getList()
      })
    }
  })
}

function handleDelete(row) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除套餐管理编号为"' + _ids + '"的数据项？').then(function() {
    return delSetmeal(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

function handleExport() {
  proxy.download('reservation/setmeal/export', {
    ...queryParams.value
  }, `setmeal_${new Date().getTime()}.xlsx`)
}

getList()
</script>

<style scoped>
.check-scroll {
  max-height: 300px;
  overflow-y: auto;
}
</style>