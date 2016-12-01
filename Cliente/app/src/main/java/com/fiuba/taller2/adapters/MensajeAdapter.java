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


import com.fiuba.taller2.R;
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

    @Override
    public void onBindViewHolder(final MensajeHolder holder, final int position) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            holder.post_author_pic.setImageDrawable(holder.context.getDrawable(R.drawable.com_facebook_profile_picture_blank_portrait));
        }
        if(mDataset.get(position).getSender_photo()!=null)Picasso.with(mCOntext).load(mDataset.get(position).getSender_photo()).into(holder.post_author_pic);
        if(mDataset.get(position).getSender_name()!=null){
            holder.post_author.setText(mDataset.get(position).getSender_name());
        }else{
            holder.post_author.setText(mDataset.get(position).getSender_id());
        }
        holder.post_content.setText(mDataset.get(position).getMessage());

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
