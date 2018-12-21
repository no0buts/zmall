package cn.xx55xx.model;

public class RedisValueReq {
    private String redisKey;

    private String redisValue;

    public RedisValueReq() {
    }

    public String getRedisKey() {
        return redisKey;
    }

    public void setRedisKey(String redisKey) {
        this.redisKey = redisKey;
    }

    public String getRedisValue() {
        return redisValue;
    }

    public void setRedisValue(String redisValue) {
        this.redisValue = redisValue;
    }
}
