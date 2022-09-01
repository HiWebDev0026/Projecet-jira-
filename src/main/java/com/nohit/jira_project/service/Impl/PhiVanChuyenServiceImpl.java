package com.nohit.jira_project.service.Impl;

import java.util.*;

import org.springframework.beans.factory.annotation.*;

import com.nohit.jira_project.model.*;
import com.nohit.jira_project.repository.*;
import com.nohit.jira_project.service.*;

public class PhiVanChuyenServiceImpl implements PhiVanChuyenService {
    @Autowired
    private PhiVanChuyenRepository phiVanChuyenRepository;

    @Override
    public List<PhiVanChuyen> getDsPhiVanChuyen() {
        // TODO Auto-generated method stub
        return phiVanChuyenRepository.findAll();
    }

    @Override
    public PhiVanChuyen getPhiVanChuyen(int id) {
        // TODO Auto-generated method stub
        return phiVanChuyenRepository.findById(id).orElse(null);
    }

    @Override
    public void savePhiVanChuyen(PhiVanChuyen phiVanChuyen) {
        // TODO Auto-generated method stub
        phiVanChuyenRepository.save(phiVanChuyen);
    }

    @Override
    public void deletePhiVanChuyen(int id) {
        // TODO Auto-generated method stub
        phiVanChuyenRepository.deleteById(id);
    }
}