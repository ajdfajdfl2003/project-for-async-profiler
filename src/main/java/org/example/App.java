package org.example;

import java.util.Timer;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        Timer t = new Timer();
        MyTask mTask = new MyTask();
        t.scheduleAtFixedRate(mTask, 0, 10000);
    }

}
