package cn.xx55xx.model;

public class ResponseData {

    private ResponseStatus responseStatus;

    private Object data;

    public ResponseData() {
    }

    public ResponseData(ResponseStatus responseStatus, Object data) {
        this.responseStatus = responseStatus;
        this.data = data;
    }

    public ResponseStatus getResponseStatus() {
        return responseStatus;
    }

    public void setResponseStatus(ResponseStatus responseStatus) {
        this.responseStatus = responseStatus;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
