package com.szl.util;

/**
 * Created by zsc on 2017/10/30.
 */
public class WordEntry implements Comparable<WordEntry> {
    public String name;
    public float score;

    public WordEntry(String name, float score) {
        this.name = name;
        this.score = score;
    }

    @Override
    public String toString() {
        return this.name;
//        return this.name + "\t" + score;
    }

    @Override
    public int compareTo(WordEntry o) {
        if (this.score < o.score) {
            return 1;
        } else {
            return -1;
        }
    }

}