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
import com.fiuba.taller2.domain.Contact;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;


/**
 * Created by Margonari on 18/09/2016.
 */
public class MyContactsRequestAdapter extends RecyclerView
        .Adapter<MyContactsRequestAdapter
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
        Button button_accept;
        Button button_reject;

        public CourseHolder(View itemView) {
            super(itemView);
            contact_photo = (ImageView) itemView.findViewById(R.id.contact_photo);
            contact_name = (TextView) itemView.findViewById(R.id.skill_name);
            contact_summary = (TextView) itemView.findViewById(R.id.distance);
            button_accept = (Button) itemView.findViewById(R.id.button_accept);
            button_reject= (Button) itemView.findViewById(R.id.button_reject);

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

    public MyContactsRequestAdapter(ArrayList<Contact> myDataset, Context mcontext) {
        mDataset = myDataset;
        mcontexts=mcontext;
    }

    @Override
    public CourseHolder onCreateViewHolder(ViewGroup parent,
                                           int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.card_view_contact_request, parent, false);

        CourseHolder dataObjectHolder = new CourseHolder(view);
        return dataObjectHolder;
    }

    @Override
    public void onBindViewHolder(CourseHolder holder, final int position) {
        holder.contact_name.setText(mDataset.get(position).getName());
        holder.contact_summary.setText(mDataset.get(position).getSummary());

        String urlImage ="http://www.thomasandfriends.com/es-es/Images/hero-6-sample-train_tcm1140-190382.png";
        Picasso.with(holder.context).load(mDataset.get(position).getPhoto()).into(holder.contact_photo);

        holder.button_accept.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                ((MyContactsRequestActivity)mcontexts).acceptContact(mDataset.get(position).getFb_id(),"true");
                ((MyContactsRequestActivity)mcontexts).restart();

            }
        });

        holder.button_reject.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                ((MyContactsRequestActivity)mcontexts).rejectContact(mDataset.get(position).getFb_id(),"true");
                ((MyContactsRequestActivity)mcontexts).restart();

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