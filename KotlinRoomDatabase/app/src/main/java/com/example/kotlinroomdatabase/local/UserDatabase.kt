package com.example.kotlinroomdatabase.local

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.kotlinroomdatabase.Model.User
import com.example.kotlinroomdatabase.local.UserDatabase.Companion.DATABASE_VERSION

@Database(entities = [User::class], version = DATABASE_VERSION)
abstract class UserDatabase:RoomDatabase() {
    abstract fun userDAO():UserDAO

    companion object {
        const val DATABASE_VERSION = 1
        val DATABASE_NAME="EDMT-Database-Room"

        private var mInstance:UserDatabase?=null

        fun getInstance(context: Context):UserDatabase{
            if(mInstance == null)
                mInstance = Room.databaseBuilder(context,UserDatabase::class.java, DATABASE_NAME)
                    .fallbackToDestructiveMigration()
                    .build()
            return mInstance!!
        }
    }
}