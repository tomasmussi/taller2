package com.fiuba.taller2.adapters
        ;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.activities.MyContactsRequestActivity;
import com.fiuba.taller2.activities.PopularContactsActivity;
import com.fiuba.taller2.domain.Contact;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;


/**
 * Created by Margonari on 18/09/2016.
 */
public class PopularContactsAdapter extends RecyclerView
        .Adapter<PopularContactsAdapter
        .CourseHolder> {
    private static String LOG_TAG = "LookupAdapter";
    private ArrayList<Contact> mDataset;
    private static MyClickListener myClickListener;
    private Context mcontexts;
    public static class CourseHolder extends RecyclerView.ViewHolder
            implements View
            .OnClickListener {
        TextView contact_name;
        TextView contact_summary;
        ImageView contact_photo;
        TextView course_session_start;
        TextView course_duration;
        Context context;
        Button button_vote;

        public CourseHolder(View itemView) {
            super(itemView);
            contact_photo = (ImageView) itemView.findViewById(R.id.contact_photo);
            contact_name = (TextView) itemView.findViewById(R.id.skill_name);
            contact_summary = (TextView) itemView.findViewById(R.id.skill_category);
            button_vote = (Button) itemView.findViewById(R.id.button_vote);

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

    public PopularContactsAdapter(ArrayList<Contact> myDataset, Context mcontext) {
        mDataset = myDataset;
        mcontexts=mcontext;
    }

    @Override
    public CourseHolder onCreateViewHolder(ViewGroup parent,
                                           int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.card_view_popular_users, parent, false);

        CourseHolder dataObjectHolder = new CourseHolder(view);
        return dataObjectHolder;
    }

    @Override
    public void onBindViewHolder(CourseHolder holder, final int position) {
        holder.contact_name.setText(mDataset.get(position).getName());
        holder.contact_summary.setText(mDataset.get(position).getSummary());

        String urlImage ="http://www.thomasandfriends.com/es-es/Images/hero-6-sample-train_tcm1140-190382.png";
        if(mDataset.get(position).getPhoto()!=null & !mDataset.get(position).getPhoto().isEmpty())Picasso.with(holder.context).load(mDataset.get(position).getPhoto()).into(holder.contact_photo);
        else{Picasso.with(holder.context).load(urlImage).into(holder.contact_photo);}

        holder.button_vote.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                ((PopularContactsActivity)mcontexts).voteContact(mDataset.get(position).getFb_id(),"true");
                ((PopularContactsActivity)mcontexts).restart();

            }
        });



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