/**
 * 消息中心
 * @class MsgCenter
 */
var MsgCenter =  {
    dict:{},
};

/**
 * 清理监听
 */
MsgCenter.clear = function() {
    this.dict = {};
}

/**
 * 添加消息监听
 * @param {string} cmd 消息唯一标识
 * @param {function} listener 侦听函数
 * @param {any} listenerObj 侦听函数所属对象
 */
MsgCenter.addListener = function(cmd, listener, listenerObj) {
    var arr = this.dict[cmd];
    if (!arr) {
        arr = [];
        this.dict[cmd] = arr;
    }
    //检测是否已经存在
    var isExist = false;
    for (var i = 0, len = arr.length; i < len; i++) {
        if (arr[i][0] == listener && arr[i][1] == listenerObj) {
            isExist = true;
        }
    }
    if(isExist) return;
    arr.push([listener, listenerObj]);
}

/**
 * 移除消息监听
 * @param {string} cmd 消息唯一标识
 * @param {function} listener 侦听函数
 * @param {any} listenerObj 侦听函数所属对象
 */
MsgCenter.removeListener = function(cmd, listener, listenerObj) {
    var arr = this.dict[cmd];
    if (!arr) {
        return;
    }

    for (var i = 0, len = arr.length; i < len; i++) {
        if (arr[i][0] == listener && arr[i][1] == listenerObj) {
            arr.splice(i, 1);
            break;
        }
    }

    if (arr.length == 0) {
        this.dict[cmd] = null;
        delete this.dict[cmd];
    }
}

/**
 * 触发消息
 * @param {string} cmd 消息唯一标识
 * @param {any} param 消息参数
 */
MsgCenter.send = function(cmd, param) {
    if (!this.dict[cmd]) { return; }
    this._dealMsg(cmd,param);
}

/**
 * 处理一条消息
 */
MsgCenter._dealMsg = function(cmd,param) {
    var listeners = this.dict[cmd];
    if (!listeners) { return; }

    for (var i = 0, len = listeners.length; i < len; i++) {
        var listener = listeners[i];
        listener[0].apply(listener[1], [param]);
    }
}

window.MsgCenter = MsgCenter;