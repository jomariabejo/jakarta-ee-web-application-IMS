package com.jomariabejo.jakartaeewebappims.util.jakartapersistence;

import javax.persistence.EntityManager;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class db {
    private static final String PERSISTENCE_UNIT_NAME = "default";
    private static EntityManagerFactory entityManagerFactory;
    private static db instance;
    private db() {
    }
    public static db getInstance() {
        if (instance == null) {
            synchronized (db.class) {
                if (instance == null) {
                    instance = new db();
                }
            }
        }
        return instance;
    }
    public EntityManagerFactory getEntityManagerFactory() {
        if (entityManagerFactory == null) {
            entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        }
        return entityManagerFactory;
    }
    public EntityManager getEntityManager() {
        return getEntityManagerFactory().createEntityManager();
    }
}
