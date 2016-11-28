package com.fiuba.taller2.adapters
        ;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.domain.Contact;
import com.squareup.picasso.Picasso;

import org.w3c.dom.Text;

import java.util.ArrayList;


/**
 * Created by Margonari on 18/09/2016.
 */
public class CoursesAdapter extends RecyclerView
        .Adapter<CoursesAdapter
        .CourseHolder> {
    private static String LOG_TAG = "CoursesAdapter";
    private ArrayList<Contact> mDataset;
    private static MyClickListener myClickListener;

    public static class CourseHolder extends RecyclerView.ViewHolder
            implements View
            .OnClickListener {
        TextView course_name;
        TextView course_description;
        ImageView course_photo;
        TextView course_session_start;
        TextView course_duration;
        Context context;

        public CourseHolder(View itemView) {
            super(itemView);
            course_name = (TextView) itemView.findViewById(R.id.course_name);
            course_description = (TextView) itemView.findViewById(R.id.course_description);
            course_photo = (ImageView) itemView.findViewById(R.id.course_photo);
            course_session_start = (TextView) itemView.findViewById(R.id.course_next_session);
           // course_duration = (TextView) itemView.findViewById(R.id.course_duration);
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

    public CoursesAdapter(ArrayList<Contact> myDataset) {
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
        holder.course_description.setText(mDataset.get(position).getName());

        String urlImage ="https://codigoespagueti.com/wp-content/uploads/2016/02/CrashBandicoot.jpg";
        Picasso.with(holder.context).load(urlImage).into(holder.course_photo);

        //holder.course_duration.setText("Duración estimada del curso: " + mDataset.get(position).getDuration() + " min.");

        // older.course_session_start.setText("El curso inicia: " + mDataset.get(position).getCurrent_sessions().get(0).getStart().substring(0,10));
    }

    public void addItem(Contact course, int index) {
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