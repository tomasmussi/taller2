package com.fiuba.taller2.adapters;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;


import com.example.margonari.taller2_frontend.R;
import com.fiuba.taller2.domain.Mensaje;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;


public class MensajeAdapter extends RecyclerView
        .Adapter<MensajeAdapter
        .MensajeHolder> {
    private static String LOG_TAG = "MensajeAdapter";
    private ArrayList<Mensaje> mDataset;
    private Context mCOntext;

    public static class MensajeHolder extends RecyclerView.ViewHolder {
        ImageView post_author_pic;
        TextView post_author;
        TextView post_content;
        TextView post_attachment;
        TextView post_date;

        Context context;

        public MensajeHolder(View itemView) {
            super(itemView);
            post_author_pic = (ImageView) itemView.findViewById(R.id.forum_post_author_pic);
            post_author = (TextView) itemView.findViewById(R.id.forum_post_author);
            post_content = (TextView) itemView.findViewById(R.id.forum_post_content);
            post_attachment = (TextView) itemView.findViewById(R.id.forum_post_attachment);
            post_date = (TextView) itemView.findViewById(R.id.forum_post_creation_date);

            context = itemView.getContext();

        }
    }

    public MensajeAdapter(ArrayList<Mensaje> myDataset, Context context) {
        mCOntext= context;
        mDataset = myDataset;
    }

    @Override
    public MensajeAdapter.MensajeHolder onCreateViewHolder(ViewGroup parent,
                                                                   int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.forum_post, parent, false);

        MensajeAdapter.MensajeHolder dataObjectHolder = new MensajeAdapter.MensajeHolder(view);
        return dataObjectHolder;
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    public void onBindViewHolder(final MensajeAdapter.MensajeHolder holder, final int position) {
        holder.post_author_pic.setImageDrawable(holder.context.getDrawable(R.drawable.com_facebook_profile_picture_blank_portrait));
       // Picasso.with(mCOntext).load( mDataset.get(position).getAuthor_image()).into(holder.post_author_pic);
        Picasso.with(mCOntext).load("https://codigoespagueti.com/wp-content/uploads/2016/02/CrashBandicoot.jpg").into(holder.post_author_pic);
        holder.post_author.setText(mDataset.get(position).getSender_id());
        holder.post_content.setText(mDataset.get(position).getMessage());

        //Log.d("AuthorImageUrl", mDataset.get(position).getAuthor_image()); //Aca recibis la imagen



        holder.post_date.setText(mDataset.get(position).getTimestamp());
    }

    public void addItem(Mensaje forumThread, int index) {
        mDataset.add(index, forumThread);
        notifyItemInserted(index);

    }

    public void deleteItem(int index) {
        mDataset.remove(index);
        notifyItemRemoved(index);
    }

    @Override
    public int getItemCount() {
        return mDataset.size();
    }




}
