package com.fiuba.taller2.adapters;

/**
 * Created by luis on 04/10/16.
 */

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.domain.CatogoryLN;

import java.util.ArrayList;


/**
 * Created by Margonari on 18/09/2016.
 */
public class CategoriesAdapter extends RecyclerView
        .Adapter<CategoriesAdapter
        .CourseHolder> {
    private static String LOG_TAG = "JobsAdapter";
    private ArrayList<CatogoryLN> mDataset;
    private static MyClickListener myClickListener;

    public static class CourseHolder extends RecyclerView.ViewHolder
            implements View
            .OnClickListener {
        TextView course_name;
        TextView course_description;
        ImageView course_photo;
        TextView course_session_start;
        Context context;

        public CourseHolder(View itemView) {
            super(itemView);
            course_name = (TextView) itemView.findViewById(R.id.profile_user_name);
            course_description = (TextView) itemView.findViewById(R.id.course_description);
            course_photo = (ImageView) itemView.findViewById(R.id.course_photo);
            course_session_start = (TextView) itemView.findViewById(R.id.course_next_session);
            context = itemView.getContext();
            Log.i(LOG_TAG, "Adding Listener");
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            myClickListener.onItemClick(getAdapterPosition(), v);
        }
    }

    public void setOnItemClickListener(MyClickListener myClickListener) {
        this.myClickListener = myClickListener;
    }

    public CategoriesAdapter(ArrayList<CatogoryLN> myDataset) {
        mDataset = myDataset;
    }

    @Override
    public CourseHolder onCreateViewHolder(ViewGroup parent,
                                           int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.card_view_row, parent, false);

        CourseHolder dataObjectHolder = new CourseHolder(view);
        return dataObjectHolder;
    }

    @Override
    public void onBindViewHolder(CourseHolder holder, int position) {
        holder.course_name.setText(mDataset.get(position).getName());
        holder.course_description.setText(mDataset.get(position).getDescription());

        //String urlImage = holder.context.getResources().getString(R.string.imagesURL) + mDataset.get(position).getId() + "." + mDataset.get(position).getFile_extension();
        // Picasso.with(holder.context).load(urlImage).into(holder.course_photo);

        //h
        // older.skill_category.setText("El curso inicia: " + mDataset.get(position).getCurrent_sessions().get(0).getStart().substring(0,10));
    }

    public void addItem(CatogoryLN course, int index) {
        mDataset.add(index, course);
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

    public interface MyClickListener {
        public void onItemClick(int position, View v);
    }
}