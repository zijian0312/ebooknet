$(document).ready(function() {
    $("#loginForm").bootstrapValidator({
        message: "This value is not valid",
        feedbackIcons: {
            valid: "glyphicon glyphicon-ok",
            invalid: "glyphicon glyphicon-remove",
            validating: "glyphicon glyphicon-refresh"
        },
        fields: {
            username: {
                message: "用户名验证失败",
                validators: {
                    notEmpty: {
                        message: "用户名不能为空"
                    },
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: "用户名长度必须为5到30位"
                    }
                }
            },
            password: {
                message: "密码验证失败",
                validators: {
                    notEmpty: {
                        message: "密码不能为空"
                    },
                    stringLength: {
                        min: 6,
                        max: 11,
                        message: "密码长度必须为6到11位"
                    }
                }
            }
        }
    }),
        $("#regForm").bootstrapValidator({
            message: "This value is not valid",
            feedbackIcons: {
                valid: "glyphicon glyphicon-ok",
                invalid: "glyphicon glyphicon-remove",
                validating: "glyphicon glyphicon-refresh"
            },
            fields: {
                uname: {
                    message: "用户名验证失败",
                    validators: {
                        notEmpty: {
                            message: "用户名不能为空"
                        },
                        stringLength: {
                            min: 5,
                            max: 15,
                            message: "用户名长度必须为5到15位"
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9]+$/,
                            message: "用户名由字母或数字组成"
                        }
                    }
                },
                pwd: {
                    message: "密码验证失败",
                    validators: {
                        notEmpty: {
                            message: "密码不能为空"
                        },
                        stringLength: {
                            min: 6,
                            max: 11,
                            message: "密码长度必须为6到11位"
                        },
                        different: {
                            field: "uname",
                            message: "不能和用户名相同"
                        },
                        regexp: {
                            regexp: /^[a-z|A-z|0-9]+$/,
                            message: "密码由大小写字母或数字组成"
                        }
                    }
                },
                pwd2: {
                    message: "密码验证失败",
                    validators: {
                        notEmpty: {
                            message: "密码不能为空"
                        },
                        stringLength: {
                            min: 6,
                            max: 11,
                            message: "密码长度必须为6到11位"
                        },
                        identical: {
                            field: "pwd",
                            message: "两次输入密码不一致"
                        },
                        regexp: {
                            regexp: /^[a-z|A-z|0-9]+$/,
                            message: "密码由大小写字母或数字组成"
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: "邮箱不能为空"
                        },
                        emailAddress: {
                            message: "请输入正确的邮箱地址"
                        }
                    }
                }
            }
        })
});