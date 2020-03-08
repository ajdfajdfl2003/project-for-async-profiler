package org.example;

import java.util.TimerTask;

class MyTask extends TimerTask {

    @Override
    public void run() {
        System.out.println("Hello World!");
    }
}
