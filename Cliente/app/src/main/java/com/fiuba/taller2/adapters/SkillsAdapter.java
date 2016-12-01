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
import com.fiuba.taller2.domain.Skill;

import java.util.ArrayList;

/**
 * A simple adapter which maintains an ArrayList of photo resource Ids. Each
 * photo is displayed as an image. This adapter supports clearing the list
 * of photos and adding a new photo.
 *
 */
public class SkillsAdapter extends BaseExpandableListAdapter {
    // Sample data set. children[i] contains the children (String[]) for
    // groups[i].
    private Context context;
    Skill[][] skill_array;
    private ArrayList<Skill> skillArrayList;
    public SkillsAdapter(Context context, ArrayList<Skill> skills){
        this.context= context;
        this.skillArrayList= skills;
        Skill[] skill_array_simple= skillArrayList.toArray(new Skill[skillArrayList.size()]);
        skill_array= new Skill[1][skill_array_simple.length];
        skill_array[0]=skill_array_simple;
        children=skill_array;
    }
    private String[] groups = { "Skills"};


    private Skill[][] children ;

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
                .inflate(R.layout.card_view_my_skills, parent, false);

        TextView skill_name = (TextView) convertView.findViewById(R.id.skill_name);
        TextView skill_category = (TextView) convertView.findViewById(R.id.distance);
        TextView skill_description = (TextView) convertView.findViewById(R.id.skill_description);

        skill_name.setText(((Skill)getChild(groupPosition, childPosition)).getName());
        skill_category.setText(((Skill)getChild(groupPosition, childPosition)).getCategory());
        skill_description.setText(((Skill)getChild(groupPosition, childPosition)).getDescription());

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
                .inflate(R.layout.card_view_group_skills, parent, false);
        TextView groupName = (TextView) convertView.findViewById(R.id.skills);

        groupName.setText("Skills");
        return convertView;
    }

    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }

    public boolean hasStableIds() {
        return true;
    }

}