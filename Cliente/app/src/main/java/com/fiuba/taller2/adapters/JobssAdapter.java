package com.fiuba.taller2.adapters;

import android.content.Context;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.domain.Job;
import com.fiuba.taller2.domain.JobPosition;

import java.util.ArrayList;

/**
 * A simple adapter which maintains an ArrayList of photo resource Ids. Each
 * photo is displayed as an image. This adapter supports clearing the list
 * of photos and adding a new photo.
 *
 */
public class JobssAdapter extends BaseExpandableListAdapter {
    // Sample data set. children[i] contains the children (String[]) for
    // groups[i].
    private Context context;
    JobPosition[][] job_array;
    private ArrayList<JobPosition> jobArrayList;
    public JobssAdapter(Context context, ArrayList<JobPosition> jobs){
        this.context= context;
        this.jobArrayList= jobs;
        JobPosition[] job_array_simple= jobArrayList.toArray(new JobPosition[jobArrayList.size()]);
        job_array= new JobPosition[1][job_array_simple.length];
        job_array[0]=job_array_simple;
        children=job_array;
    }
    private String[] groups = { "Jobs"};


    private JobPosition[][] children ;

    public int  getChildCount(){
      return   children[0].length;
    }
    public Object getChild(int groupPosition, int childPosition) {
        return children[groupPosition][childPosition];
    }

    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    public int getChildrenCount(int groupPosition) {
        int i = 0;
        try {
            i = children[groupPosition].length;

        } catch (Exception e) {
        }

        return i;
    }

    public TextView getGenericView() {
        // Layout parameters for the ExpandableListView
        AbsListView.LayoutParams lp = new AbsListView.LayoutParams(
                ViewGroup.LayoutParams.FILL_PARENT, 64);

        TextView textView = new TextView(context);
        textView.setLayoutParams(lp);
        // Center the text vertically
        textView.setGravity(Gravity.CENTER_VERTICAL | Gravity.LEFT);
        textView.setTextColor(R.color.primary_dark);
        // Set the text starting position
        textView.setPadding(36, 0, 0, 0);
        return textView;
    }

    public View getChildView(int groupPosition, int childPosition,
                             boolean isLastChild, View convertView, ViewGroup parent) {

       convertView= LayoutInflater.from(parent.getContext())
                .inflate(R.layout.card_view_my_jobs, parent, false);

        TextView job_name = (TextView) convertView.findViewById(R.id.job_name);
        TextView job_category = (TextView) convertView.findViewById(R.id.job_category);
        TextView job_description = (TextView) convertView.findViewById(R.id.job_description);

        job_name.setText(((JobPosition)getChild(groupPosition, childPosition)).getName());
        //job_category.setText(((Job)getChild(groupPosition, childPosition)).getCategory());
        job_description.setText(((JobPosition)getChild(groupPosition, childPosition)).getDescription());

        return convertView;
    }

    public Object getGroup(int groupPosition) {
        return groups[groupPosition];
    }

    public int getGroupCount() {
        return groups.length;
    }

    public long getGroupId(int groupPosition) {
        return groupPosition;
    }

    public View getGroupView(int groupPosition, boolean isExpanded,
                             View convertView, ViewGroup parent) {
        convertView= LayoutInflater.from(parent.getContext())
                .inflate(R.layout.card_view_group_jobs, parent, false);
        TextView groupName = (TextView) convertView.findViewById(R.id.jobs);

        groupName.setText("Jobs");
        return convertView;
    }

    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }

    public boolean hasStableIds() {
        return true;
    }

}