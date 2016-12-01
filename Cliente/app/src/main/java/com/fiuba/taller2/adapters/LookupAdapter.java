package com.fiuba.taller2.adapters
        ;

import android.content.Context;
import android.os.AsyncTask;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.activities.Linkedun;
import com.fiuba.taller2.activities.SearchableActivity;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.services.SendContactRequestServices;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;


/**
 * Created by Margonari on 18/09/2016.
 */
public class LookupAdapter extends RecyclerView
        .Adapter<LookupAdapter
        .CourseHolder> {
    private static String LOG_TAG = "LookupAdapter";
    private ArrayList<Contact> mDataset;
    private static MyClickListener myClickListener;
    private Context context;
    private ViewGroup parentView;
    public static class CourseHolder extends RecyclerView.ViewHolder
            implements View
            .OnClickListener {
        TextView contact_name;
        TextView contact_summary;
        ImageView contact_photo;
        TextView course_session_start;
        TextView course_duration;
        Button button_addContact;
        Button button_sendMessage;
        Context context;

        public CourseHolder(View itemView) {
            super(itemView);
            contact_photo = (ImageView) itemView.findViewById(R.id.contact_photo);
            contact_name = (TextView) itemView.findViewById(R.id.skill_name);
            contact_summary = (TextView) itemView.findViewById(R.id.distance);
            context = itemView.getContext();
            button_addContact = (Button) itemView.findViewById(R.id.button_addContact);
            button_sendMessage= (Button) itemView.findViewById(R.id.button_sendMessage);
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

    public LookupAdapter(ArrayList<Contact> myDataset, Context context) {
        mDataset = myDataset;
        this.context= context;
    }

    @Override
    public CourseHolder onCreateViewHolder(ViewGroup parent,
                                           int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.card_view_contact_lookup, parent, false);

        this.parentView=parent;
        CourseHolder dataObjectHolder = new CourseHolder(view);
        return dataObjectHolder;
    }

    @Override
    public void onBindViewHolder(final CourseHolder holder, final int position) {
        holder.contact_name.setText(mDataset.get(position).getName());
        holder.contact_summary.setText(mDataset.get(position).getSummary());


        String urlImage ="http://www.cleverfiles.com/howto/wp-content/uploads/2016/08/mini.jpg";
        if(mDataset.get(position).getPhoto()!=null & !mDataset.get(position).getPhoto().isEmpty())Picasso.with(holder.context).load(mDataset.get(position).getPhoto()).into(holder.contact_photo);
        else{
            Picasso.with(holder.context).load(urlImage).into(holder.contact_photo);
        }
        if(mDataset.get(position).getIs_contact().equals("true"))holder.button_addContact.setVisibility(View.GONE);
        if(mDataset.get(position).getIs_friend_request_sent()==true)holder.button_addContact.setVisibility(View.GONE);

        holder.button_addContact.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                    if(holder.button_addContact.isClickable()){
                        AsyncSendContactRequest asyncSendContactRequest = new AsyncSendContactRequest();

                        asyncSendContactRequest.execute(mDataset.get(position).getFb_id());

                        try {
                            Estado estado = (Estado) asyncSendContactRequest.get();
                            if (estado != null) Log.d("Estado", estado.toString());

                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        } catch (ExecutionException e) {
                            e.printStackTrace();
                        }
                        holder.button_addContact.setVisibility(View.GONE);
                        makeSnack();
                    }else{

                    }
            }
        });
    }



    public void makeSnack(){

        ((SearchableActivity)context).makeSnack();
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

    private class AsyncSendContactRequest extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];

                SendContactRequestServices SendContactRequestServices = new SendContactRequestServices();
                SendContactRequestServices.setApi_security(Linkedun.getApi_token());
                Estado estado = (Estado) SendContactRequestServices.get(contact_fb_id);
                return estado;
            } catch (Exception e) {
                Log.e("SendSolicitudContact", e.getMessage(), e);
            }

            return null;
        }

    }

}