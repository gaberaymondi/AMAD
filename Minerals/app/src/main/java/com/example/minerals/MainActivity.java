package com.example.minerals;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = "MainActivity";

    //vars
    private ArrayList<String> mNames = new ArrayList<>();
    private ArrayList<String> mImageUrls = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Log.d(TAG,"OnCreate: started.");

        initImageBitmaps();
    }

    private void initImageBitmaps(){
        Log.d(TAG,"initImageBitmaps: preparing bitmaps.");

        mImageUrls.add("https://cdn.britannica.com/48/100748-050-FFD5027B/Quartz-one-silica-varieties.jpg");
        mNames.add("Quartz");

        mImageUrls.add("https://static2.proactiveinvestors.com/thumbs/upload/News/Image/2018_07/672z311_1532919507_Pioneer-potassium-feldspar.jpg");
        mNames.add("Potassium Feldspar");

        mImageUrls.add("https://upload.wikimedia.org/wikipedia/commons/f/f6/Albite_-_Crete_%28Kriti%29_Island%2C_Greece.jpg");
        mNames.add("Plagioclase Feldspar");

        mImageUrls.add("https://cdn.shopify.com/s/files/1/0125/7596/5242/products/Pinapple_Calcite_8-12_Oz_b_1400x.jpg?v=1533026135");
        mNames.add("Calcite");

        mImageUrls.add("https://upload.wikimedia.org/wikipedia/commons/7/77/Gips_-_Lubin%2C_Poland..jpg");
        mNames.add("Gypsum");

        mImageUrls.add("https://live.staticflickr.com/7848/32878790248_23602a08ee_b.jpg");
        mNames.add("Kaolinite");

        mImageUrls.add("https://www.liberaldictionary.com/wp-content/uploads/2019/02/halite-5337.jpg");
        mNames.add("Halite");

        mImageUrls.add("https://www.minimegeology.com/shop/images/p.446.1-chert_sedimentary_rock.jpg");
        mNames.add("Chert");

        mImageUrls.add("https://upload.wikimedia.org/wikipedia/commons/2/29/Alurgite_St_Marcel.jpg");
        mNames.add("Muscovite");

        mImageUrls.add("https://www.minimegeology.com/shop/images/p.435.1-biotite_mineral.jpg");
        mNames.add("Biotite");

        mImageUrls.add("https://www.crystalage.com/img/products/chlorite-quartz-85mm_15.jpg");
        mNames.add("Chlorite");

        mImageUrls.add("https://geodil.dperkins.org/i/21.jpg");
        mNames.add("Hornblende");

        mImageUrls.add("https://www.crystalclassics.co.uk/Uploads/ShopItems/00/03/04/84/ShopItemImg1_PICT/CC19181-Pyroxene-Group-Sweden-1908233699314ed.jpg");
        mNames.add("Pyroxene");

        mImageUrls.add("https://images-na.ssl-images-amazon.com/images/I/61wEY%2Bm1IDL._AC_SL1500_.jpg");
        mNames.add("Olivine");

        mImageUrls.add("https://www.crystalage.com/img/products/hematite-mineral-specimen-42mm_17.jpg");
        mNames.add("Hematite");

        initRecyclerView();

    }

    private void initRecyclerView(){
        Log.d(TAG,"initRecyclerView: init recyclerview");
        RecyclerView recyclerView = findViewById(R.id.recycler_view);
        RecyclerViewAdapter adapter = new RecyclerViewAdapter(this,mNames,mImageUrls);
        recyclerView.setAdapter(adapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

    }
}
